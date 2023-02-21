sub init()
    'get the scenegraph scene
    m.scene = m.top.getScene()
    if m.scene <> invalid
        'find the screens group, this is where each screen will be added to
        m.screens =  m.scene.findNode("screens")
        if m.screens = invalid
            'if screens group doesn't exist, add it
            m.screens = createObject("roSGNode","Group")
            m.screens.id = "screens"
            m.scene.appendChild(m.screens)
        end if
    end if
    m.currentScreen = invalid
    m.prevScreens = []
end sub

sub goToScreen(params)
    if params <> invalid and params.type <> invalid
        screenName = params.type
        if screenName <> invalid and screenName <> ""
            'handle if the screen being nav'd away from should go in to the history array
            if params.closeCurrent <> invalid and not params.closeCurrent or params.closeCurrent = invalid
                if m.currentScreen <> invalid then m.prevScreens.push(m.currentScreen)
            end if
            'hide the currently shown screen
            if m.currentScreen <> invalid then m.currentScreen.visible = false
            'check if the screen in question is already open
            if isOpen(screenName)
                m.currentScreen = m.screens.findNode(screenName)
                m.screens.removeChild(m.currentScreen)
            else
                'set up new screen
                navToScreen = CreateObject("roSGNode",screenName)
                navToScreen.id = screenName
                'set as the new current screen
                m.currentScreen = navToScreen
            end if
            'add to the screens group
            m.screens.appendChild(m.currentScreen)
            'make it visible and focused to display
            m.currentScreen.visible = true
            m.currentScreen.setFocus(true)
            'nav to it depending on if there are params to pass
            if params.data <> invalid
                m.currentScreen.callFunc("onOpen",{data: params.data})
            else
                m.currentScreen.callFunc("onOpen",{})
            end if
        end if
    end if
end sub

function isOpen(checkScreen)
    open = false
    screens = m.screens.getChildren(-1,0)
    for each screen in screens
        if checkScreen = screen.id
            open = true
            exit for
        end if
    end for
    return open
end function

sub goBack(params)
    if 0 < m.prevScreens.count()
        if params <> invalid and params.closeCurrent <> invalid
            goToScreen({type: m.prevScreens.pop().id, closeCurrent: params.closeCurrent})
        else
            goToScreen({type: m.prevScreens.pop().id})
        end if
    else
        goToScreen({type:"ExitScreen"})
    end if
end sub