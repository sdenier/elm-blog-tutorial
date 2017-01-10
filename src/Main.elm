module Main exposing (..)

import Navigation
import Html exposing (..)
import UrlParser as Url exposing ((</>))


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


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostsRoute
    | PostRoute PostId
    | EditRoute PostId
    | NotFound


postsParser : Url.Parser a a
postsParser =
    Url.s "posts"


postParser : Url.Parser (Int -> a) a
postParser =
    postsParser </> Url.int


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map PostsRoute postsParser
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


type alias State =
    { route : Route }


initialState : Route -> State
initialState route =
    { route = route }


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    ( initialState (router location), Cmd.none )



-- UPDATE


type Msg
    = UrlChange Navigation.Location


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    ( state, Cmd.none )



-- VIEW


view : State -> Html Msg
view state =
    case state.route of
        HomeRoute ->
            div [] [ text "Home" ]

        PostsRoute ->
            div [] [ text "Posts" ]

        PostRoute postId ->
            div [] [ text ("Post #" ++ (toString postId)) ]

        EditRoute postId ->
            div [] [ text ("Edit Post #" ++ (toString postId)) ]

        NotFound ->
            div [] [ text "Not Found" ]
