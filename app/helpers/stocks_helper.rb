module StocksHelper

    def calcurate_week_day
        list = []
        first_day = Date.today.beginning_of_year
        week_start_day = Date.today.beginning_of_week
        for i in (0..4)
            unless current_user.stocks.find_by(shipment_week: (week_start_day.cweek + i))
                path_day = (week_start_day.cweek + i) * 7
                week_day = first_day + path_day - first_day.cwday + 1 - 7
                list_element = [ week_day.strftime("%m月%d日週出荷分") , week_start_day.cweek + i ]
                list.push(list_element)
            end
        end
        return list
    end

    def stock_list
        list = []
        factor = [["BOX野菜 - Mサイズ", "MiddleBox"], ["小品目BOX野菜", "FewItemBox" ]]
        postages = current_user.postages
        for item in factor do
            for postage in postages do
                list.push(item) if postage.item_type == item[1]
            end
        end
        return list
    end
    
end