// C++ program to check if
// given date is valid or not.
#include<iostream>
using namespace std;

const int MAX_VALID_YR = 9999;
const int MIN_VALID_YR = 1800;

// Returns true if
// given year is valid.
bool isLeap(int year)
{
// Return true if year
// is a multiple of 4 and
// not multiple of 100.
// OR year is multiple of 400.
return (((year % 4 == 0) &&
		(year % 100 != 0)) ||
		(year % 400 == 0));
}

// Returns true if given
// year is valid or not.
bool isValidDate(int d, int m, int y)
{
	// If year, month and day
	// are not in given range
	if (y > MAX_VALID_YR ||
		y < MIN_VALID_YR)
	return false;
	if (m < 1 || m > 12)
	return false;
	if (d < 1 || d > 31)
	return false;

	// Handle February month
	// with leap year
	if (m == 2)
	{
		if (isLeap(y))
		return (d <= 29);
		else
		return (d <= 28);
	}

	// Months of April, June,
	// Sept and Nov must have
	// number of days less than
	// or equal to 30.
	if (m == 4 || m == 6 ||
		m == 9 || m == 11)
		return (d <= 30);

	return true;
}

// Driver code
int main(void)
{
isValidDate(10, 12, 2000)? cout << "Yes\n" :
						cout << "No\n";

isValidDate(31, 11, 2000)? cout << "Yes\n" :
						cout << "No\n";
}
