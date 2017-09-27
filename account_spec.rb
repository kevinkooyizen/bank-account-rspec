require "rspec"
require 'byebug'

require_relative "account"

describe Account do

  let(:account_number)  { "1234567890" }
  let(:new_account)     { Account.new(account_number) }

  describe "#initialize" do
    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Account.new }.to raise_error(ArgumentError)
      end
    end

  end

  describe "#transactions" do
    context "starts with zero" do
      it "returns zero when new Account is created" do
        expect(new_account.transactions).to eq [0]
      end
    end

  end

  describe "#balance" do
    context "returns balance of account" do
      it "checks if balance starts with zero" do
        expect(new_account.balance).to eq 0
      end
    end

  end

  describe "#account_number" do
    context "shows last 4 digits" do
      it "displays only the last 4 digits of the account" do
        expect(new_account.acct_number).to eq("******7890")
      end
    end

  end

  describe "deposit!" do
    context "with invalid input" do
      let(:amount) { -1 }
      it "only receives positive values" do
        expect {new_account.deposit!(amount)}.to raise_error(NegativeDepositError)
      end
    end

    context "with valid input" do
      let(:amount) { 10 }
      it "increases balance based on input" do
        new_account.deposit!(amount)
        expect(new_account.balance).to eq 10
      end
    end

  end

  describe "#withdraw!" do
    context "with valid input beyond balance" do
      it "decreases balance based on input" do
        expect {new_account.withdraw!(10)}.to raise_error(OverdraftError)
      end
    end

    context "with valid input beyond balance" do
      it "decreases balance based on input" do
        new_account.deposit!(10)
        new_account.withdraw!(5)
        expect(new_account.balance).to eq 5
      end
    end
  end
end