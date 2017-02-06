module View.MainView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (State)
import Messages exposing (Msg)
import View.Body as BodyView
import View.Header as HeaderView


view : State -> Html Msg
view state =
    div [ class "text-wrap" ]
        [ HeaderView.view
        , BodyView.view state
        ]
