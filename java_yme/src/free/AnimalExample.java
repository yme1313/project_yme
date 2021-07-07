package free;

public class AnimalExample {

	public static void main(String[] args) {
		
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		dog.sound();  
		cat.sound();
		
		Animal animal = null;
		
		animal = new Dog();
		animal.sound();
		
		animalSound(dog);
		animalSound(new Cat());

	}
	public static void animalSound(Animal animal) {
		animal.sound();
	}
}
