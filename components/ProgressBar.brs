function init() as void

  m.backgroundRect = m.top.findNode("backgroundRect")
  m.progressRect = m.top.findNode("progressRect")
  m.scrubberPoster = m.top.findNode("scrubber")

  reloadUI()
  adjustColors()
end function

'''''''''
' adjustColors: Will assign colors to the UIviews. Only called initially. All other coloring will happen directly.
' 
'''''''''
function adjustColors() as void
  m.backgroundRect.color = m.top.progressBarBackgroundColor
  m.progressRect.color = m.top.progressBarColor
  m.scrubberPoster.blendColor = m.top.scrubberColor
end function

'''''''''
' reloadUI: This logic only calls when the initial setting up of UI
' 
'''''''''
function reloadUI() as void
  progressBarHeight = m.top.height
  scrubberHeight = m.top.scrubberHeight
  scrubberWidth = m.top.scrubberWidth

  scrubberYTranslation = (progressBarHeight - scrubberHeight) / 2
  scrubberXTranslation = (scrubberWidth) / 2
  m.scrubberPoster.translation = [-scrubberXTranslation, scrubberYTranslation]
end function


'''''''''
' onProgressChange: Progress bar handling. Here all the main calculations will happen
' 
'''''''''
function onProgressChange() as void
  progressValue = m.top.progress
  barWidth = m.top.width
  if (progressValue >= 0 AND barWidth > 0)
    progressWidth = barWidth * progressValue
    m.progressRect.width = progressWidth

    scrubberWidth = m.top.scrubberWidth
    m.scrubberPoster.translation = [progressWidth - (scrubberWidth/2), m.scrubberPoster.translation[1]]
  end if 
end function