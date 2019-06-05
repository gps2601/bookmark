require 'tag'

describe Tag do
  it 'can return tags stored in the database' do
    tags = Tag.all

    expect(tags).to include('informative')
    expect(tags).to include('coding')
    expect(tags).to include('fun')
  end

  it 'can add tag and store in the database' do
    expect(Tag.all).to_not include('my new tag')
    Tag.create('my new tag')

    expect(Tag.all).to include('my new tag')
  end

  it 'can wont add a tag already exists in the database' do
    Tag.create('my new tag')
    amount_of_tags = Tag.all.size
    Tag.create('my new tag')

    expect(Tag.all.size).to eq(amount_of_tags)
  end
end
