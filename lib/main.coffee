root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'nodegg-ide-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'nodegg-ide-ui.tabSizing', (value) ->
      setTabSizing(value)

    atom.config.observe 'nodegg-ide-ui.hideDockButtons', (value) ->
      setHideDockButtons(value)

    atom.config.observe 'nodegg-ide-ui.autoHideStatus', (value) ->
      setAutoHideStatus(value)

    # DEPRECATED: This can be removed at some point (added in Atom 1.17/1.18ish)
    # It removes `layoutMode`
    if atom.config.get('nodegg-ide-ui.layoutMode')
      atom.config.unset('nodegg-ide-ui.layoutMode')

  deactivate: ->
    unsetFontSize()
    unsetTabSizing()
    unsetHideDockButtons()
    unsetAutoHideStatus()


# Font Size -----------------------

setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''


# Tab Sizing -----------------------

setTabSizing = (tabSizing) ->
  root.setAttribute('nodegg-ide-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('nodegg-ide-ui-tabsizing')


# Dock Buttons -----------------------

setHideDockButtons = (hideDockButtons) ->
  if hideDockButtons
    root.setAttribute('nodegg-ide-ui-dock-buttons', 'hidden')
  else
    unsetHideDockButtons()

unsetHideDockButtons = ->
  root.removeAttribute('nodegg-ide-ui-dock-buttons')

# Auto Hide Status -------------------
setAutoHideStatus = (autoHideStatus) ->
  if autoHideStatus
    root.setAttribute('nodegg-ide-ui-auto-hide-status', true)
  else
    unsetAutoHideStatus()

unsetAutoHideStatus = ->
  root.removeAttribute('nodegg-ide-ui-auto-hide-status')
