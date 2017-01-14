module View.Body exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (..)
import Routes exposing (..)
import View.Post.Show as ShowPost
import View.NotFound as NotFound


view : State -> Html Msg
view state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            div [] [ text "Home" ]

        PostRoute postId ->
            ShowPost.view postId

        EditRoute postId ->
            div [] [ text ("Edit Post #" ++ (toString postId)) ]

        NotFound ->
            NotFound.view
