require "spec_helper"

RSpec.describe Shackleton::Route do

  let(:name) { :line }
  let(:path) { 'line(/:id)'}

  subject { Shackleton::Route.new(name: name, path: path) }

  it { expect(subject.named_fragments).to eql([:id]) }

  context "With a nested route" do
    let(:nested_name) { :status }
    before { subject.route(nested_name) }

    it { expect(subject.routes).not_to be_empty }
    it { expect(subject[nested_name]).not_to be_nil }
  end

  context "Building with a block" do
    let(:nested_name) { :status }
    subject do 
      Shackleton::Route.new(name: name, path: path) do
        route :status
      end
    end

    it { expect(subject.routes).not_to be_empty }
    it { expect(subject[nested_name]).not_to be_nil }
  end

end
