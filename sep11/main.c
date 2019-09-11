#include <iostream>

using namespace std;

int main(int argc, char* argv[]) {
	int nums[5], result;

	for(int i=0; i<5; i++) {
		cin >> nums[i];
	}
	for(int j=0; j<5; j++) {
		if(j < 4) {
			result += nums[j];
		}
		else {
			result *= nums[j];
		}
	}
	cout << "The result is: " << result << endl;
	return 0;
}
