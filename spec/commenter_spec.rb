require 'commenter'

describe Commenter do
  it 'can return comments stored' do

    expect(Commenter.all).to include('This is the first comment about google?!')
    expect(Commenter.all).to include('This is the first comment about youtube?!')
    expect(Commenter.all).to include('This is the first comment about software?!')
  end

  it 'can create a comment and add to db' do
    expect(Commenter.all).to_not include('this is a comment')

    Commenter.create('1', 'this is a comment')

    expect(Commenter.all)
  end
end
