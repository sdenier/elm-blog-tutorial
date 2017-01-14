module View.Post.Show exposing (..)

import Html exposing (..)
import Routes exposing (PostId)


view : PostId -> Html msg
view postId =
    div [] [ text ("Post #" ++ (toString postId)) ]
