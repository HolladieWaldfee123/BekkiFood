module Hauptseite exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Nachricht
    = PlusEins
    | MinusEins


update nachricht model =
    case nachricht of
        PlusEins ->
            model + 1

        MinusEins ->
            model - 1


view model =
    div []
        [ button [ onClick PlusEins ] [ text "+" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick MinusEins ] [ text "-" ]
        ]
