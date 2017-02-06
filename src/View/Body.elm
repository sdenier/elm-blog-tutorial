module View.Body exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (..)
import View.Posts.List as PostsList
import View.Post.Edit as EditPost
import View.Post.Show as ShowPost
import View.NotFound as NotFound


view : State -> Html Msg
view state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            PostsList.view state.posts

        NewPostRoute ->
            EditPost.view state.current

        EditDraftRoute ->
            EditPost.view state.current

        PostRoute _ ->
            ShowPost.view state.current

        NotFound ->
            NotFound.view
