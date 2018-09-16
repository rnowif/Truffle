require 'Truffle/Index/index'
require 'Truffle/Index/line'
require 'Truffle/Index/Tokenizer/standard_tokenizer'

RSpec.describe 'Index' do
  index = Index.new(StandardTokenizer.new)
  it 'should find file when the query is exactly in the line' do
    index.add(Line.new('toto.pdf', 1, 'Hello world!'))
    results = index.search('Hello')
    expect(results).not_to be_empty
    expect(results[0].file_name).to eq('toto.pdf')
  end
end
