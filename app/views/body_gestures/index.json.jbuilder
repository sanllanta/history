json.array!(@body_gestures) do |body_gesture|
  json.extract! body_gesture, :id, :body_gesture
  json.url body_gesture_url(body_gesture, format: :json)
end
