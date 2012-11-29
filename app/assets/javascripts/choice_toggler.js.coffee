BundledGoods.choice_toggler = (goods, combo) ->
  goods.click ->
    turnOff(combo)
  combo.click ->
    turnOff(goods)

turnOff = (selector) ->
  selector.prop('checked', false)
