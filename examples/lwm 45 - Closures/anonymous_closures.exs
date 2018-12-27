say_something = fn (something) -> (fn -> IO.puts(something) end) end
say_dog = say_something.("dog")
say_cat = say_something.("cat")

say_dog.()
say_cat.()