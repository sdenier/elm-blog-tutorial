module Main exposing (..)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events as Evt exposing (..)
import Json.Decode as Json
import UrlParser as Url exposing ((</>))
import Messages exposing (..)
import Models exposing (..)


-- MAIN


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- ROUTES


type Route
    = HomeRoute
    | PostRoute PostId
    | EditRoute PostId
    | NotFound


postParser : Url.Parser (Int -> a) a
postParser =
    Url.s "posts" </> Url.int


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map PostRoute postParser
        , Url.map EditRoute (postParser </> Url.s "edit")
        ]


router : Navigation.Location -> Route
router location =
    let
        routeResult =
            Url.parsePath routePatterns location
    in
        case routeResult of
            Just route ->
                route

            Nothing ->
                NotFound



-- MODEL


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    ( newState (router location), Cmd.none )



-- UPDATE


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            ( state, Navigation.newUrl "/" )

        ShowPost postId ->
            ( state, Navigation.newUrl <| "/posts/" ++ (toString postId) )

        UrlChange location ->
            ( { state | route = (router location) }, Cmd.none )



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
