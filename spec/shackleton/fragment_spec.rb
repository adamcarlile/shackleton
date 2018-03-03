require "spec_helper"

RSpec.describe Shackleton::Fragment do

  let(:route)     { Shackleton::Route.new(name: :test, path: 'test/:id') }
  let(:arguments) { { id: 10, query: 'test' } }

  subject { Shackleton::Fragment.new(route, arguments) }

  it { expect(subject.query_params).to eql({query: 'test'})}
  it { expect(subject.arguments).to eql({id: 10})}

  it { expect(subject.call).to eql('test/10')}

  context "With url escaping spaces" do
    let(:argument) { 'hello world' }
    let(:arguments) { { id: argument } }

    it { expect(subject.call).to eql("test/hello%20world")}
  end

  context "With url escaping slashes" do
    let(:argument) { 'hello/world' }
    let(:arguments) { { id: argument } }

    it { expect(subject.call).to eql("test/hello%2Fworld")}
  end


end
