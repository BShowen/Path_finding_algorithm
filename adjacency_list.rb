module AdjacencyList
    #I am using this module as a mixin for the Knight class. 
    
    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x - 2,y - 1] unless (x - 2 < 0 || y - 1 < 0)
                temp_list << [x - 2,y + 1] unless (x - 2 < 0 || y + 1 > 7)                 
                temp_list << [x + 2,y - 1] unless (x + 2 > 7 || y - 1 < 0)
                temp_list << [x + 2,y + 1] unless (x + 2 > 7 || y + 1 > 7)                 
                temp_list << [x - 1,y - 2] unless (y - 2 < 0 || x - 1 < 0)
                temp_list << [x + 1,y - 2] unless (y - 2 < 0 || x + 1 > 7)
                temp_list << [x - 1,y + 2] unless (y + 2 > 7 || x - 1 < 0)                 
                temp_list << [x + 1,y + 2] unless (y + 2 > 7 || x + 1 > 7) 
                completed_list << temp_list          
            end
        end
        completed_list
    end

    def legal_moves_adj(coordinates)
        index = get_index_from_coordinates(coordinates)
        @adjacency_list[index]
    end

    def get_index_from_coordinates(coordinates)
        index = coordinates.join.to_i
        if index <= 7
            index
        elsif index <= 17
            index - 2
        elsif index <= 27
            index - 4
        elsif index <= 37
            index - 6
        elsif index <= 47
            index - 8
        elsif index <= 57
            index -10
        elsif index <= 67
            index - 12
        elsif index <= 77
            index - 14
        end
    end 

    def legal_move?(current_coordinates,desired_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        x1 = desired_coordinates[0]
        y1 = desired_coordinates[1]
        legal_moves_adj([x,y]).include? [x1,y1]
    end

    # def display_adj_list
    #     @adjacency_list.each do |data|
    #         puts "#{data}"
    #     end
    # end 

    # def count_adj_list
    #     counter = adjacency_list.length
    #     @adjacency_list.each do |item|
    #         counter += item.length
    #     end
    #     counter
    # end

end