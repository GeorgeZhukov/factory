require "spec_helper"

module Factory
  describe Factory do

    describe "::new" do
      it "returns something" do
        expect(Factory.new).not_to be_nil
      end

      it "accepts arguments" do
        expect { Factory.new(:a, :b, :c) }.not_to raise_exception
      end

      it "accepts only symbols and constant" do
        expect { Factory.new("hello world") }.to raise_exception
        expect { Factory.new(1,2,3) }.to raise_exception
        expect { Factory.new(:a, :b) }.not_to raise_exception
        expect { Factory.new("MyClass") }.not_to raise_exception
      end

      it "returns an object with class 'Class'" do
        expect(Factory.new(:a).class).to be(Class)
      end
    end

    describe "Factory instance" do
      subject(:instance) { Factory.new("MyClass", :name, :city).new("Joe", "Chicago") }

      it "has a correct class name" do
        expect(instance.class.name).to eq("Factory::Factory::MyClass")
      end

      it "has a property accessor" do
        instance.name = "Joe"
        expect(instance.name).to eq("Joe")
      end

      it "has a brackets getter accessor" do
        instance[:name] = "John"
        expect(instance[:name]).to eq("John")

        instance["name"] = "Jim"
        expect(instance["name"]).to eq("Jim")

        instance[0] = "Michael"
        expect(instance[0]).to eq("Michael")
      end

      describe "#values" do
        values = ["Joe", "Chicago"]
        #puts instance
        #expect(instance.values).to eq(values)
      end

    end
  end
end
