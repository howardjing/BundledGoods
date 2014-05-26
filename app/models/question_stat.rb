class QuestionStat < ActiveRecord::Base
  STATEMENT_SHOWN_PREFIX = "Menu item was shown: bundle "

  belongs_to :question, touch: true
  validates_presence_of :question

  scope :ascending,  lambda { order("question_stats.created_at ASC") }
  scope :descending, lambda { order("question_stats.created_at DESC") }

  scope :statements, lambda { where("question_stats.content like 'Menu%'") }
  scope :statements_shown, lambda { where("question_stats.content like '#{STATEMENT_SHOWN_PREFIX}%'")}
  scope :selections, lambda { where("question_stats.content like 'Good%' or question_stats.content like 'Combo%'") }
  scope :good, lambda { where("question_stats.content like 'Good%'") }
  scope :combo, lambda { where("question_stats.content like 'Combo%'") }

  scope :good_selected,    lambda { where("question_stats.content like 'Good%true'") }
  scope :good_deselected,  lambda { where("question_stats.content like 'Good%false'") }
  scope :combo_selected,   lambda { where("question_stats.content like 'Combo%true'") }
  scope :combo_deselected, lambda { where("question_stats.content like 'Combo%false'") }

  scope :created_after, lambda { |created_at| where("question_stats.created_at > ?", created_at) }


  def user
    question.user
  end

  def real?
    !question.demo?
  end

  def stat_type
    content.split(' ', 2).first
  end

  def combo?
    stat_type == 'Combo'
  end

  def good?
    stat_type == 'Good'
  end

  def menu_item?
    stat_type == 'Menu'
  end

  def statement_shown?
    menu_item? && content.starts_with?(STATEMENT_SHOWN_PREFIX)
  end

  def statement_goods
    content.delete(STATEMENT_SHOWN_PREFIX).split(",").map(&:to_i)
  end

  # if the content ends in true, then it was selected
  def selected?
    content.rpartition(" ").last == 'true'
  end

  def good_number
    if good?
      content.split(" ", 3)[1].to_i
    end
  end

  def statement_value
    value_analyzer.statement_value
  end

  def partial_value
    value_analyzer.partial_value
  end

  private

  def value_analyzer
    if combo?
      @value_analyzer ||= ComboAnswer.new(self)
    elsif good?
      @value_analyzer ||= GoodAnswer.new(self)
    elsif menu_item?
      @value_analyzer ||= MenuItem.new(self)
    else
      raise StandardError.new("PROGRAMMING ERROR!!!! INVALID QUESITON STAT")
    end
  end

  class GoodAnswer
    attr_reader :stat
    def initialize(stat)
      @stat = stat
    end

    # answers don't have a statement value
    def statement_value
      nil
    end

    # compute selected values up to now
    def partial_value
      @partial_value ||= compute_partial_value
    end

    private

    def compute_partial_value
      active_goods = Set.new
      preceeding_selections.each do |selection|
        if selection.combo?
          active_goods = Set.new # reset active goods
        elsif selection.good?
          if selection.selected?
            active_goods.add(selection.good_number)
          else
            active_goods.delete(selection.good_number)
          end
        else
          raise StandardError.new("PROGRAMMING ERROR: examine QuestionStat #{stat.id}")
        end
      end
      stat.question.bundle(active_goods.to_a.sort)
    end

    # preceeding selections includes current selection
    def preceeding_selections
      @preceeding_selections ||= stat.question.question_stats.selections
                                     .where('created_at <= ?', stat.created_at)
    end
  end

  class ComboAnswer
    attr_reader :stat
    def initialize(stat)
      @stat = stat
    end

    def statement_value
      nil
    end

    def partial_value
      @partial_value ||= if stat.selected?
        stat.question.combo_witheffect
      else
        0
      end
    end
  end

  class MenuItem
    attr_reader :stat
    def initialize(stat)
      @stat = stat
    end

    def statement_value
      @statement_value ||= if stat.statement_shown?
        stat.question.bundle(stat.statement_goods)
      else
        0
      end
    end

    # menu interactions don't have a partial value
    def partial_value
      nil
    end
  end
end
