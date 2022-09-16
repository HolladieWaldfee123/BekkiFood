module Hauptseite exposing (..)

import Browser
import Html exposing (Html, button, div, h1, hr, text)
import Html.Attributes exposing (style)
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
        [ h1 [] [ text "Deine Inteligente Einkaufsliste" ]
        , button [ onClick PlusEins ] [ text "+" ]
        , div [] [ text (String.fromInt model ++ " Portionen Nudeln mit Pesto ") ]
        , button [ onClick MinusEins ] [ text "-" ]
        , hr [] []
        , div [] [ text (String.fromInt (model * 100) ++ " Gramm Nudeln") ]
        , div [] [ text (String.fromInt (model * 5) ++ " Löffel Pesto") ]
        ]
