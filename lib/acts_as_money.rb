module ActsAsMoney

  def acts_as_money(field)
    cents_attr = "#{field}_in_cents"

    class_eval(<<-EOC, __FILE__, __LINE__)
      def #{field}
        Money.new(self.#{cents_attr} || 0)
      end

      def #{field}=(amount)
        self.#{cents_attr} = (amount || 0).to_money.cents
      end
    EOC
  end

end
