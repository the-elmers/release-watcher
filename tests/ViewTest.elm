module ViewTest exposing (suite)

import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (containing, tag, text)
import Main exposing (view, Msg(..))

suite : Test
suite =
    describe "The app"
        [ test "Increase" <|
            \_ ->
                view 0
                |> Query.fromHtml
                |> Query.find
                    [ tag "button"
                    , containing [ text "-" ]
                    ]
                |> Event.simulate Event.click
                |> Event.expect Decrement
        , test "Decrease" <|
            \_ ->
                view 0
                |> Query.fromHtml
                |> Query.find
                    [ tag "button"
                    , containing [ text "+" ]
                    ]
                |> Event.simulate Event.click
                |> Event.expect Increment
        ]
