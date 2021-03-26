colors_list = [ "red",
                 "green",
                 "blue",
                 "white",
                 "black",
                 "gray"
                ]

colors_list.each { |color_name| Color.create(name: color_name) }