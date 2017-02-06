module Main exposing (..)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (..)
import Ports
import Update exposing (..)
import View.Body as BodyView
import View.Header as HeaderView


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


view : State -> Html Msg
view state =
    div [ class "text-wrap" ]
        [ HeaderView.view
        , BodyView.view state
        ]


subscriptions : State -> Sub Msg
subscriptions state =
    Ports.loadDraft PostReceived
