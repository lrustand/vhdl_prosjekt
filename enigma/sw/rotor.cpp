#include <stdio.h>

class rotor
{
	int* arr;
	int* inv;
	int size;

public:
	int index = 0;

	rotor(int arr[])
	{
		this->arr = arr;
		this->size = *(&arr + 1) - arr;
		printf("%d", this->size);
	int a;
	scanf("%d", a);
		inv = new int[size];
		for(int i = 0; i < size; i++)
		{
			inv[arr[i]] = i;
		}
	}

	void inc()
	{
		index++;
		index %= size;
	}

	int lookup(int x)
	{
		return (arr[(x + index)%size] + size - index)%size;
	}

	int reverse_lookup(int x)
	{
		return (inv[(x + index)%size] + size - index)%size;
	}
};
