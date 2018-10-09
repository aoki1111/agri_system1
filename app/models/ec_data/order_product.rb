module EcData
    class OrderProduct < EcData::Base
        belongs_to :stock, class_name:"Stock"
        belongs_to :order_list, class_name:"EcData::OrderList"
        belongs_to :product, class_name:"EcData::Product"

        def send_shipment_complete(user)
            order_list = EcData::OrderList.find_by(id:self.order_list_id)
            buyer_address = order_list.buyer_address
            sending_address = order_list.sending_address unless buyer_address.same_sending_address
            product = EcData::Product.find_by(id:self.product_id)
            postage = user.postages.find_by(item_type:self.product_id)
            OrderMailer.shipment_notification(order:self,buyer_address:buyer_address,sending_address:sending_address ,product:product,postage:postage).deliver_now
        end
    end
end
