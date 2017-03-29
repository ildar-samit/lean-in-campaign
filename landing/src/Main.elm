import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Http
import RemoteData
import Json.Decode as Decode
import Json.Decode.Pipeline
import Navigation



endpointUrl : String -> String
endpointUrl name =
  "https://mars-backend-160319.appspot.com/api/meatballs-inc/prototype-x/" ++ name


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


init : (Model, Cmd Msg)
init =
  ( Model "", Cmd.none )


-- MODEL

type alias Model =
  { todo : String }


-- UPDATE

type Msg
    = TODO


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    TODO ->
      ( model, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [ style headerStyle ]
        [ div [ class "container mb-4", style [ ( "padding-top", "30px" ), ( "padding-bottom", "25px" ), ( "font-style", "italic" ), ( "color", "#fff" ), ( "background", "#124" ) ] ]
            [ div [] [ text "Given how fast the world moves today, grabbing opportunities is more important than ever." ]
            , div [ style [ ( "text-align", "right" ) ] ] [ text "- Lean In, page 123" ]
            ]
        ]
    , formView
    , div [ class "my-4 container", style [ ( "text-align", "center" ) ] ]
        [ a [ class "btn btn-primary px-5 py-3", style [ ( "border-radius", "30px" ) ], href "#" ] [ text "Get Started" ] ]
    , div [ class "container", style [ ( "margin", "120px 0" ), ( "padding-top", "100px" ), ( "padding-bottom", "90px" ), ( "background", "#124" ), ( "color", "#fff" ), ( "font-style", "italic" ) ] ]
        [ div [] [ text "Taking initiative pays off. It is hard to visualize someone as a leader if she is always waiting to be told what to do." ]
        , div [ style [ ( "text-align", "right" ) ] ] [ text "- Lean In, page 456" ]
        ]
    , div [ class "container", style [ ( "font-weight", "bold" ), ( "font-size", "24px" ) ] ] [ text "Today’s world is different from 10 years ago. Very, very different." ]
    , div [ class "container my-5", style [ ( "font-size", "22px" ) ] ] [ text "Ten years ago: the iPhone didn’t exist. Cloud computing was unknown. Artificial Intelligence sounded like science fiction." ]
    , div [ class "container my-5", style [] ] [ text "Do you work for a company that doesn’t even have an app for its employees? Should’t every business have their own app?" ]
    , div [ class "container my-5", style [] ] [ text "Do you want your team to benefit from apps, cloud computing, and yes, even artificial intelligence?" ]
    , div [ class "container my-5", style [ ( "text-align", "center" ) ] ]
        [ a [ class "btn btn-primary px-5 py-3", style [ ( "border-radius", "30px" ), ( "margin-bottom", "80px" ) ], href "#" ] [ text "Yep." ] ]
    ]


formView : Html Msg
formView =
  Html.form [ class "container" ]
    [ input [ type_ "text", class "form-control mb-2", value "", placeholder "Name", style [ ( "border-radius", "30px" ), ( "padding", ".5rem .75rem .4rem" ), ( "line-height", "1.7" ) ] ] []
    , input [ type_ "text", class "form-control mb-2", value "", placeholder "Email", style [ ( "border-radius", "30px" ), ( "padding", ".5rem .75rem .4rem" ), ( "line-height", "1.7" ) ] ] []
    , input [ type_ "text", class "form-control", value "", placeholder "Company Name / Link", style [ ( "border-radius", "30px" ), ( "padding", ".5rem .75rem .4rem" ), ( "line-height", "1.7" ) ] ] []
    ]


headerStyle : List ( String, String )
headerStyle =
  [ ( "padding-top", "200px" )
  , ( "margin-bottom", "20px" )
  --, ( "background", "rgb(165,197,192) url(https://storage.googleapis.com/aux-mars-backend-160319/527680322-flipped.jpg) 100% -150px no-repeat" )
  --, ( "background", "rgb(255,255,255) url(https://storage.googleapis.com/aux-mars-backend-160319/498463970.jpg) 50% 0 no-repeat" )
  , ( "background", "rgb(255,255,255) url(https://storage.googleapis.com/aux-mars-backend-160319/537291165.jpg) 50% -30px no-repeat" )
  , ( "background-size", "650px auto" )
  ]


listItem : String -> String -> Html msg
listItem url label =
  a [ href url, class "list-group-item list-group-item-action justify-content-between" ] [ text label ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
