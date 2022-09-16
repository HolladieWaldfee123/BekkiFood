module Hauptseite exposing (..)

import Browser
import Html exposing (Html, button, div, h1, hr, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main : Program () Modell Nachricht
main =
    Browser.sandbox { init = startModell, update = update, view = view }


type alias Modell =
    { nudeln : Int
    , kartoffeln : Int
    }


{-| Unser initiales Modell, was beim Start der Website geladen wird.
-}
startModell : Modell
startModell =
    { nudeln = 1, kartoffeln = 1 }


type Nachricht
    = PlusEinsNudeln
    | MinusEinsNudeln
    | PlusEinsKartoffeln
    | MinusEinsKartoffeln


update : Nachricht -> Modell -> Modell
update nachricht altesModell =
    case nachricht of
        PlusEinsNudeln ->
            { altesModell | nudeln = altesModell.nudeln + 1 }

        MinusEinsNudeln ->
            { altesModell | nudeln = altesModell.nudeln - 1 }

        PlusEinsKartoffeln ->
            { altesModell | kartoffeln = altesModell.kartoffeln + 1 }

        MinusEinsKartoffeln ->
            { altesModell | kartoffeln = altesModell.kartoffeln - 1 }


view : Modell -> Html Nachricht
view modell =
    div []
        [ h1 [] [ text "Deine Inteligente Einkaufsliste" ]
        , button [ onClick PlusEinsNudeln ] [ text "+" ]
        , div [] [ text (String.fromInt modell.nudeln ++ " Portionen Nudeln mit Pesto ") ]
        , button [ onClick MinusEinsNudeln ] [ text "-" ]
        , button [ onClick PlusEinsKartoffeln ] [ text "+" ]
        , div [] [ text (String.fromInt modell.kartoffeln ++ " Portionen Ofen Kartoffeln ") ]
        , button [ onClick MinusEinsKartoffeln ] [ text "-" ]
        , hr [] []
        , div [] [ text (String.fromInt (modell.nudeln * 100) ++ " Gramm Nudeln") ]
        , div [] [ text (String.fromInt (modell.nudeln * 5) ++ " Löffel Pesto") ]
        , hr [] []
        , div [] [ text (String.fromInt (modell.kartoffeln * 100) ++ " Gramm Kartoffeln") ]
        , div [] [ text (String.fromInt (modell.kartoffeln * 5) ++ " Ml Öl") ]
        ]
