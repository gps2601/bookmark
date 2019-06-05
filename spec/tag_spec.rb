require 'tag'

describe Tag do
  it 'can return tags stored in the database' do
    tags = Tag.all

    expect(tags).to include('informative')
    expect(tags).to include('coding')
    expect(tags).to include('fun')
  end
end
