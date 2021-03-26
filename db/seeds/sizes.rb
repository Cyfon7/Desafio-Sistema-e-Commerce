size_list = [ "XS",
              "S",
              "M",
              "L",
              "XL"
            ]

size_list.each { |size_name| Size.create(name: size_name) }