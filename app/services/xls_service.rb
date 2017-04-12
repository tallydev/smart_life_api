class XlsService

	def initialize admin
		@admin = admin
		@subdistrict = admin.subdistrict
		@work_book = Spreadsheet::Workbook.new
		@xls_report = StringIO.new
	end

	def order_cart_items params
		query = params['q']

		 @orders = Order.paid.subdistrict_is(
				@subdistrict.id
			).paid_time_in(
				query&.[]('paid_time_gteq_date'), 
				query&.[]('paid_time_lteq_date')
			)
		raise '该查询条件下无订单' if @orders.blank?
 		@cart_items = @orders.collect(&:cart_items).map(&:to_a).reduce(:+).select { |obj| obj.is_a?(CartItem)}

    add_sale_table
    add_sale_statistics_table

    @work_book.write @xls_report
    @xls_report.string
	end

	private

		def create_table params
			
		end

		def add_sale_table 
			# 商品成交情况
	    sheet1 = @work_book.create_worksheet :name => "商品成交情况"

	    size = Spreadsheet::Format.new 
	    sheet1.row(0).default_format = size
	    sheet1.row(0).concat %w{ 商品id 商品名称 成交单价 该组数量 该组总价 成交日期 }

	    count_row = 1
	  	@cart_items.each do |obj|
	      sheet1[count_row, 0] = obj.product_id
	      sheet1[count_row, 1] = obj.title
	      sheet1[count_row, 2] = obj.after_discount
	      sheet1[count_row, 3] = obj.count
	      sheet1[count_row, 4] = obj.after_discount * obj.count
	      sheet1[count_row, 5] = obj.order.paid_time_output
	  
	      count_row += 1
	    end
		end

		def add_sale_statistics_table 
			# 销售情况统计
			result = Hash.new(0)
	    @cart_items.each do |cart_item|
	    	result[cart_item.product_id] += cart_item.count
  		end

	    sheet2 = @work_book.create_worksheet :name => "销售情况统计"
	    size = Spreadsheet::Format.new :weight => :bold, :size => 10
	    sheet2.row(0).default_format = size
  		sheet2.row(0).concat %w{ 商品id 商品名称 成交总数 成交总金额 }

  		count_row = 1
  		sale_sum = 0.00
  		result.each do |product_id, count|
  			product = Product.find(product_id)
  			sheet2[count_row, 0] = product.id
	      sheet2[count_row, 1] = product.title
	      sheet2[count_row, 2] = count
	      its_sale = (product.after_discount * count).round(2)
	      sheet2[count_row, 3] = its_sale
	  		sale_sum += its_sale
	      count_row += 1
			end
			count_row += 1		
			sheet2[count_row, 0] = '总计'
			sheet2[count_row, 1] = sale_sum.round(2)
		end

end