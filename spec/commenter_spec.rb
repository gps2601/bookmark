require 'commenter'

describe Commenter do
  it 'can return comments stored' do

    expect(Commenter.all).to include('This is the first comment about google?!')
    expect(Commenter.all).to include('This is the first comment about youtube?!')
    expect(Commenter.all).to include('This is the first comment about software?!')
  end
end
