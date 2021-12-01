#include <stdio.h>

class rotor
{
	int arr[26];
	int inv[26];

public:
	int index = 0;

	rotor(int* arr)
	{
		for(int i = 0; i < 26; i++)
		{
                        this->arr[i] = arr[i];
			inv[arr[i]] = i;
		}
	}

	void inc()
	{
		index++;
		index %= 26;
	}

	int lookup(int x)
	{
		return (arr[(x + index)%26] + 26 - index)%26;
	}

	int reverse_lookup(int x)
	{
		return (inv[(x + index)%26] + 26 - index)%26;
	}
};
