import random
import string
import time

def randomString():
	print(''.join(random.choice(string.letters + string.digits + string.whitespace + string.uppercase) for _ in range(random.randint(1,50))))

def main():
	while True:
		time.sleep(random.randint(0,5))
		randomString()

if __name__ == "__main__":
	main()

	
