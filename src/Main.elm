module Main exposing (..)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (..)
import Routes exposing (..)
import Update exposing (..)
import View.Body as BodyView
import View.Header as HeaderView


-- MAIN


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- MODEL


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    ( newState (router location), Cmd.none )



-- VIEW


view : State -> Html Msg
view state =
    div [ class "text-wrap" ]
        [ HeaderView.view
        , BodyView.view state
        ]
