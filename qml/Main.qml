import VPlay 2.0
import QtQuick 2.0
import "scenes"
import "."

GameWindow {
    id: window

    screenWidth: 640
    screenHeight: 960

    // You get free licenseKeys from http://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from http://v-play.net/licenseKey>"


    // create and remove entities at runtime
    EntityManager {
        id: entityManager
        entityContainer: gameScene
    }
//    EntityManager {
//        id: entityManagerForAnime
//        entityContainer: menuScene
//    }

    NetworkQMLLoader{
        id:networkQmlLoaderScene
        onBackButtonPressed: window.state = "menu"
    }

    MenuScene {
        id: menuScene

        // listen to the button signals of the scene and change the state according to it
        onPlayPressed: {
            window.state = "selectLevel"
        }
        onShowLeaderBoardPressed: {
            window.state = "leaderBoard"
        }

        onShowHelpMenuPressed: {
            window.state = "gameHelp"
        }

        onCreditsPressed: window.state = "credits"
        // the menu scene is our start scene, so if back is pressed there we ask the user if he wants to quit the application
        onBackButtonPressed: {
            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2)
        }
        onExitPressed: {
            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2)
        }

        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                // only quit, if the activeScene is menuScene - the messageBox might also get opened from other scenes in your code
                if (accepted && window.activeScene === menuScene)
                    Qt.quit()
            }
        }
    }

    GameHelpScene{
        id:gameHelpScene
        onBackButtonPressed: window.state = "menu"
    }

    // credits scene
    CreditsScene {
        id: creditsScene
        onBackButtonPressed: window.state = "menu"
    }
    SelectLevelScene {
        id: selectLevelScene
        onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
          //  gameScene.setLevel(selectedLevel)
            GameInfo.activeLevelFileName = selectedLevel
            window.state = "game"
        }
        onBackButtonPressed: window.state = "menu"
    }

    // game scene to play a level
    GameScene {
        id: gameScene
        onBackButtonPressed: window.state = "menu"
    }

    // menuScene is our first scene, so set the state to menu initially
    state: "menu"
    activeScene: menuScene

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
            PropertyChanges {
                target: window
                activeScene: menuScene
            }
        },
        State {
            name: "leaderBoard"
            PropertyChanges {
                target: networkQmlLoaderScene
                opacity:1
            }
            PropertyChanges {
                target: window
                activeScene: networkQmlLoaderScene
            }
        },
        State {
            name: "gameHelp"
            PropertyChanges {
                target: gameHelpScene
                opacity:1
            }
            PropertyChanges {
                target: window
                activeScene: gameHelpScene
            }
        },
        State {
            name: "credits"
            PropertyChanges {
                target: creditsScene
                opacity: 1
            }
            PropertyChanges {
                target: window
                activeScene: creditsScene
            }
        },
        State {
            name: "selectLevel"
            PropertyChanges {
                target: selectLevelScene
                opacity: 1
            }
            PropertyChanges {
                target: window
                activeScene: selectLevelScene
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
            PropertyChanges {
                target: window
                activeScene: gameScene
            }
        }
    ]
}
