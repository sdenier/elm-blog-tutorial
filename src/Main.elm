module Main exposing (..)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events as Evt exposing (..)
import Json.Decode as Json
import Messages exposing (..)
import Models exposing (..)
import Routes exposing (..)
import Update exposing (..)


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
        [ viewHeader
        , viewBody state
        ]


viewHeader : Html Msg
viewHeader =
    header [ class "main-header" ]
        [ goLink "/" ShowHome "Home"
        ]


goLink : String -> Msg -> String -> Html Msg
goLink url msg linkText =
    let
        linkOptions =
            { stopPropagation = True, preventDefault = True }

        linkHandler =
            Evt.onWithOptions "click" linkOptions (Json.succeed msg)
    in
        a [ href url, linkHandler, class "nav-link" ]
            [ text linkText ]


viewBody : State -> Html Msg
viewBody state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            div [] [ text "Home" ]

        PostRoute postId ->
            div [] [ text ("Post #" ++ (toString postId)) ]

        EditRoute postId ->
            div [] [ text ("Edit Post #" ++ (toString postId)) ]

        NotFound ->
            div [] [ text "Not Found" ]
