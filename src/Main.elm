module Main exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Ports
import Update exposing (update)
import View.MainView exposing (view)


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    update (UrlChange location) initialState


subscriptions : State -> Sub Msg
subscriptions state =
    Ports.loadDraft PostReceived
