package paymentmodel;


//payment class
public class payment {

	private int id;
	private String cardholder;
	private String cardno;
	private String CardType;
	private String CardCvv;
	private String expireDate;
	private String Amount;
	
	//constructor with id
	public payment(int id, String cardHolder, String cardNo, String cardType, String cardCvv, String expireDate,
			String amount) {
		
		this.id = id;
		this.cardholder = cardHolder;
		this.cardno = cardNo;
		this.CardType = cardType;
		this.CardCvv = cardCvv;
		this.expireDate = expireDate;
		this.Amount = amount;
	}
	
	// constructor without id
	public payment(String cardHolder, String cardNo, String cardType, String cardCvv, String expireDate,
			String amount) {
		
		this.cardholder = cardHolder;
		this.cardno = cardNo;
		this.CardType = cardType;
		this.CardCvv = cardCvv;
		this.expireDate = expireDate;
		this.Amount = amount;
	}
	
	//declare getters
	public int getId() {
		return id;
	}
	public String getCardHolder() {
		return cardholder;
	}
	public String getCardNo() {
		return cardno;
	}
	public String getCardType() {
		return CardType;
	}
	public String getCardCvv() {
		return CardCvv;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public String getAmount() {
		return Amount;
	}


	
	
	
	
	
	
}
