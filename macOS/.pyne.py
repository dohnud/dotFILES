import os
from numpy import *

import sys

sys.ps1 = "\033[1;32m╮\n╰─✦▶︎\033[0m "
sys.ps2 = "\033[1;34m╎    \033[0m"

if 'get_ipython' in dir():

	from IPython.terminal.prompts import Prompts, Token
	
	class __FUCKYOUIPYTHONSUCKMYDICK(Prompts):
		def in_prompt_tokens(self):
			return [
				(Token.Prompt, "╮"),
				(Token.Name.Function, " [" + str(self.shell.execution_count) + "]"),
				(Token.Prompt, "\n╰──✦▶︎ ")
			]
		def continuation_prompt_tokens(self, width=None):
			if width is None:
				width = self._width()
			return [
				(Token.Name.Function, ("╎    " + ' ' * (width - len("╎    ")))),
			]
		def out_prompt_tokens(self):
			return [
				(Token.OutPromptNum, "╎ ")
			]

	__fuckyou = get_ipython()
	__fuckyou.prompts = __FUCKYOUIPYTHONSUCKMYDICK(__fuckyou)
	__fuckyou.pt_app.auto_suggest = None


# for mac and linux(here, os.name is 'posix')
if os.name == 'posix':
	_ = os.system('clear')
else:
	# for windows platfrom
	_ = os.system('cls')

__term_size__x = os.get_terminal_size()[0]
def print_c(left, center, right, spacer=' '):
	offset_l = len(left)
	offset_c = len(center)
	offset_r = len(right)
	print(
		left,
		spacer * ((__term_size__x-offset_c)//2 - offset_l) + center + spacer * ((__term_size__x-offset_c+1)//2 - offset_r),
		right,
	sep='')
def print_l(left, center, right, spacer=' '):
	offset_l = len(left)
	offset_c = len(center)
	offset_r = len(right)
	print(
		left,
		spacer + center + spacer * ((__term_size__x-offset_c) - offset_r - offset_l - 1),
		right,
	sep='')

# lil hello message
print_c("╭",''                                    , "╮", spacer='─')
print_c("│", "Welcome to Caleb's Wonder World !!!", "│")
print_l("├",''                                    , "┤", spacer='─')
print_l("│", "Bored of doing homework by hand?"   , "│")
print_l("│", "Thats what computers are for!"      , "│")
print_l("│",''                                    , "│")
print_l("├",''                                    , "┤", spacer='─')
print_c("│", "☞ Type `help()` for some pointers"  , "│")
print_l("╰─",''                                   ,"─╯", spacer='━')


class Vector(object):
	def __init__(self, x=0, y=0, z=0):
		self._x = x
		self._y = y
		self._z = z
		self.vec = [x, y, z]

	@property
	def x(self): return self._x
	@property
	def y(self): return self._y
	@property
	def z(self): return self._z

	@x.setter
	def x(self, n): self.vec[0]=n; self._x=n; return n
	@y.setter
	def y(self, n): self.vec[1]=n; self._y=n; return n
	@z.setter
	def z(self, n): self.vec[2]=n; self._z=n; return n

	def __repr__(self):
		return '<{self.vec[0]}, {self.vec[1]}, {self.vec[2]}>\t{self.x}i + {self.y}j + {self.z}k'.format(self=self)

	def __add__(self, other):
		x1, y1, z1 = self.vec
		x2, y2, z2 = other.vec
		return Vector(x1+x2, y1+y2, z1+z2)
	
	def __sub__(self, other):
		x1, y1, z1 = self.vec
		x2, y2, z2 = other.vec
		return Vector(x1-x2, y1-y2, z1-z2)
	
	def __mul__(self, other:int):
		return Vector(self.x * other, self.y * other, self.z * other)

	def __truediv__(self, other:int):
		return Vector(self.x / other, self.y / other, self.z / other)
	
	def __neg__(self):
		return Vector(-self.x, -self.y, -self.z)

	def cross(self, other):
		x1, y1, z1 = self.vec
		x2, y2, z2 = other.vec
		return Vector(
			y1*z2 - z1*y2,
			z1*x2 - x1*z2,
			x1*y2 - y1*x2
		)

	def dot(self, other):
		x1, y1, z1 = self.vec
		x2, y2, z2 = other.vec
		return x1*x2 + y1*y2 + z1*z2

	def len_sqrd(self):
		return self.x**2 + self.y**2 + self.z**2

	def len(self):
		return sqrt(self.len_sqrd())

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def display_vectors_2d(*args, ax=None):
	if ax is None: print('Non axes!!'); return
	x_min = y_min = -1
	x_max = y_max = 1
	for i, vector in enumerate(args):
		if vector.x > x_max: x_max = vector.x
		if vector.x < x_min: x_min = vector.x
		if vector.y > y_max: y_max = vector.y
		if vector.y < y_min: y_min = vector.y
	zero = zeros(len(args))
	xs = [v.x for v in args]
	ys = [v.y for v in args]
	ax.quiver(zero,zero, xs,ys, color='black', scale=(x_max-x_min)+(y_max-y_min))
	ax.plot([x_min, x_max], [0,0], linestyle='dashed', alpha=0.5, color='red')
	ax.plot([0,0], [y_min, y_max], linestyle='dashed', alpha=0.5, color='green')
	ax.plot([0,0], [0,0], linestyle='dashed', alpha=0.5, color='blue')
	ax.set_xlim([x_min-1, x_max+1])
	ax.set_ylim([y_min-1, y_max+1])

def display_vectors(*args, projection='3d'):
	if len(args) > 26: print('tooooo many vectors dude!'); return
	fig = plt.figure()
	ax = None
	if projection == '2d':
		ax = fig.add_subplot(111)
		display_vectors_2d(*args, ax=ax)
	else:
		ax = fig.add_subplot(111, projection)
		ax.set_proj_type('ortho')
		x_min = y_min = z_min = -1
		x_max = y_max = z_max = 1
		for i, vector in enumerate(args):
			if vector.x > x_max: x_max = vector.x
			if vector.x < x_min: x_min = vector.x
			if vector.y > y_max: y_max = vector.y
			if vector.y < y_min: y_min = vector.y
			if vector.z > z_max: z_max = vector.z
			if vector.z < z_min: z_min = vector.z
			# ax.text(vector.x,vector.y,vector.z, chr(97+i), color='black')
		zero = zeros(len(args))
		xs = [v.x for v in args]
		ys = [v.y for v in args]
		zs = [v.z for v in args]
		ax.quiver(zero,zero,zero, xs,ys,zs, color='black', scale=(x_max-x_min)+(y_max-y_min))
		ax.plot([x_min, x_max], [0,0], [0,0], linestyle='dashed', alpha=0.5, color='red')
		ax.plot([0,0], [y_min, y_max], [0,0], linestyle='dashed', alpha=0.5, color='green')
		ax.plot([0,0], [0,0], [z_min, z_max], linestyle='dashed', alpha=0.5, color='blue')
		ax.set_xlim([x_min-1, x_max+1])
		ax.set_ylim([y_min-1, y_max+1])
		ax.set_zlim([z_min-1, z_max+1])
	plt.subplots_adjust(0,0,1,1)
	plt.show()


def vec(x=0,y=0,z=0):
	return Vector(x,y,z)

def help():
	print("""
class: Vector(x,y,z)
for quickly making vectors
vec(x,y,x)

to display some vectors
display_vectors(v1,v2,v3,v...) 		
	""")
