require 'spec_helper'

describe SpreeTaxjar::Taxable do
  let(:order) { create(:order) }
  let(:tax_category) { create(:tax_category) }
  let(:country) { create(:country) }
  let(:calculator) { Spree::Calculator::TaxjarCalculator.new }

  describe '#taxjar_applicable?' do
    context 'when TaxRate matches tax_zone' do
      before do
        Spree::Config[:tax_using_ship_address] = false
        @zone = create(
          :zone,
          name: "Country Zone",
          default_tax: false,
          zone_members: [],
          states: [order.bill_address.country.states.first]
        )
        @zone.zone_members.create(:zoneable => order.bill_address.country)
        @rate = Spree::TaxRate.create(amount: 1, zone: @zone,
                  tax_category: tax_category, calculator: calculator)
      end

      it 'should return true' do
        expect(Spree::TaxRate.match(order.tax_zone)).to eq([@rate])
      end
    end

    context 'when TaxRate does not matches tax_zone' do
      before do
        @rate = Spree::TaxRate.create(amount: 1, zone: nil,
                  tax_category: tax_category, calculator: calculator)
      end

      it 'should return false' do
        expect(Spree::TaxRate.match(order.tax_zone)).to eq([])
      end
    end
  end

end
