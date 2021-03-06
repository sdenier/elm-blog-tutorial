module Update exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Ports
import Requests
import Routes


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        Navigate url ->
            ( state, Navigation.newUrl url )

        UrlChange location ->
            urlUpdate location state

        PostsRetrieved (Ok posts) ->
            ( { state | posts = Just posts }, Cmd.none )

        PostsRetrieved (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( state, Cmd.none )

        PostReceived post ->
            ( { state | current = Just post }, Cmd.none )

        PostRetrieved (Ok post) ->
            ( { state | current = Just post }, Cmd.none )

        PostRetrieved (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( state, Cmd.none )

        UpdatePostTitle newTitle ->
            let
                newPost =
                    updatePostTitle state.current newTitle

                newState =
                    { state | current = newPost }

                newCmd =
                    Ports.saveDraft newPost
            in
                newState ! [ newCmd ]

        UpdatePostBody newBody ->
            let
                newPost =
                    updatePostBody state.current newBody

                newState =
                    { state | current = newPost }

                newCmd =
                    Ports.saveDraft newPost
            in
                newState ! [ newCmd ]


urlUpdate : Navigation.Location -> State -> ( State, Cmd Msg )
urlUpdate location state =
    let
        newRoute =
            case (Routes.router location) of
                Just route ->
                    route

                Nothing ->
                    NotFound

        newState =
            { state | route = newRoute }
    in
        case newRoute of
            HomeRoute ->
                ( newState, Requests.retrievePosts )

            NewPostRoute ->
                ( { newState | current = Just newPost }, Cmd.none )

            EditDraftRoute ->
                ( newState, Ports.getDraft () )

            PostRoute postId ->
                ( newState, Requests.retrievePost postId )

            _ ->
                ( newState, Cmd.none )


updatePostTitle : Maybe Post -> String -> Maybe Post
updatePostTitle current newTitle =
    case current of
        Just post ->
            Just { post | title = newTitle }

        Nothing ->
            Nothing


updatePostBody : Maybe Post -> String -> Maybe Post
updatePostBody current newBody =
    case current of
        Just post ->
            Just { post | body = newBody }

        Nothing ->
            Nothing
