describe Booking do 

  it "checks if the entered date range is valid" do
    start_date = "01/01/21"
    end_date = "02/12/21"
    expect(Booking.valid_date_range(start_date, end_date)).to eq true
  end

  it "returns false if the entered date range is invalid" do
    start_date = "01/01/21"
    end_date = "02/12/20"
    expect(Booking.valid_date_range(start_date, end_date)).to eq false
  end

  it "converts string into Date" do
    date = "02/02/21"
    expect(Booking.str_to_date(date).class).to eq Date
    expect(Booking.str_to_date(date).strftime("%d/%m/%y")). to eq "02/02/21"
  end

end
