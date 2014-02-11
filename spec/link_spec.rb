require 'spec_helper'

describe Link do
	context 'demonstration of how datamapper works' do
		it 'should be create and then retrieved from the database' do
			expect(Link.count).to eq(0)
			Link.create(:title => "Makers Academy", 
                  :url => "http://www.makersacademy.com/")
			expect(Link.count).to eq(1)
			link = Link.first
			expect(link.title).to eq("Makers Academy")
			expect(link.url).to eq("http://www.makersacademy.com/")
			link.destroy
			expect(Link.count).to eq(0)
		end
	end
end