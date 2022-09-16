module Hauptseite exposing (..)

import Browser
import Html exposing (Html, button, div, h1, hr, text)
import Html.Events exposing (onClick)


main : Program () Modell Nachricht
main =
    Browser.sandbox { init = startModell, update = update, view = view }


type alias Modell =
    { nudeln : Int
    , kartoffeln : Int
    , bratnudeln : Int
    }


{-| Unser initiales Modell, was beim Start der Website geladen wird.
-}
startModell : Modell
startModell =
    { nudeln = 1, kartoffeln = 1, bratnudeln = 1 }


type Nachricht
    = NudelnÄndern Int
    | KartoffelnÄndern Int
    | BratnudelnÄndern Int


update : Nachricht -> Modell -> Modell
update nachricht altesModell =
    case nachricht of
        NudelnÄndern änderung ->
            { altesModell | nudeln = altesModell.nudeln + änderung }

        KartoffelnÄndern änderung ->
            { altesModell | kartoffeln = altesModell.kartoffeln + änderung }

        BratnudelnÄndern änderung ->
            { altesModell | bratnudeln = altesModell.bratnudeln + änderung }


view : Modell -> Html Nachricht
view modell =
    div []
        [ h1 [] [ text "Deine Inteligente Einkaufsliste" ]
        , viewEinRezept modell.nudeln " Portionen Nudeln mit Pesto " NudelnÄndern
        , hr [] []
        , viewEinRezept modell.kartoffeln " Portionen Ofen Kartoffeln " KartoffelnÄndern
        , hr [] []
        , viewEinRezept modell.bratnudeln " Portionen Bratnudeln mit Pilzen " BratnudelnÄndern
        , hr [] []
        , viewEineZutat (modell.nudeln * 100 + modell.bratnudeln * 100) " Gramm Nudeln"
        , hr [] []
        , viewEineZutat (modell.nudeln * 5) " Löffel Pesto"
        , hr [] []
        , viewEineZutat (modell.kartoffeln * 100) " Gramm Kartoffeln"
        , hr [] []
        , viewEineZutat (modell.kartoffeln * 5 + modell.bratnudeln * 5) " ml Öl"
        , hr [] []
        , viewEineZutat (modell.bratnudeln * 40) " Gramm Pilze"
        ]


viewEinRezept : Int -> String -> (Int -> Nachricht) -> Html Nachricht
viewEinRezept anzahl beschreibung nachricht =
    div []
        [ button [ onClick (nachricht 1) ] [ text "+" ]
        , div [] [ text (String.fromInt anzahl ++ beschreibung) ]
        , button [ onClick (nachricht -1) ] [ text "-" ]
        ]


viewEineZutat : Int -> String -> Html Nachricht
viewEineZutat anzahl beschreibung =
    div [] [ text (String.fromInt anzahl ++ beschreibung) ]
