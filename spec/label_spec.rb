require_relative('spec_helper')

describe Label do
  before :all do
    @label = Label.new('new', 'red')
    @item = Item.new('22-5-2000')
    @label.add_item(@item)
  end

  it "initializes an instance of the class" do
    label = Label.new('new', 'red')
    expect(label).to be_instance_of Label
  end

  it 'stores an item in its collection' do
    items = @label.items
    expect(items).to include @item
  end

  it 'sets self as label attribute for added item' do
    label = @item.label
    expect(label).to eq @label
  end
end