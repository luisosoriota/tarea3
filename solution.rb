#Solution File

#puts "PON UN NUMERO"
#A = gets
#puts "PON OTRO NUMERO"
#B = gets
#C = A + B
#puts "LA SUMA DE LOS NUMEROS ES: " + C


class Node

	def initialize (dato,ref = nil)
		@dato = dato
		@ref = ref
	end
	
	def get_dato
		return @dato
	end

	def set_dato (nuevodato)
		@dato = nuevodato
	end

	def get_referencia
		return @ref
	end
	
	def set_referencia(nuevareferencia)
		@ref = nuevareferencia
	end
end

class LinkedList
	def initialize
		@tamano = 0
		@header = nil

	end

	def agregar_elemento (valor)
		@tamano = @tamano + 1

		if @header == nil
			@header = Node.new(valor)
		else
		nodoActual = @header
		while nodoActual.get_referencia != nil
			nodoActual = nodoActual.get_referencia
		end
		nodoActual.set_referencia( Node.new(valor) )
		end
		
	end

	def quitar_elemento (datoaEliminar)
		nodoActual = @header
		if nodoActual.get_dato == datoaEliminar
			@header = @header.get_referencia
		else
			nodoActual = @header
			while (nodoActual.get_referencia != nil) && ((nodoActual.get_referencia).get_dato != datoaEliminar)
				nodoActual = nodoActual.get_referencia
			end
			if (nodoActual != nil) && (nodoActual.get_referencia != nil)
				nodoActual.set_referencia( (nodoActual.get_referencia).get_referencia )
			end
			
		end
	end

	def imprimir_lista
		nodoActual = @header
		lista_completa = []
		while nodoActual.get_referencia != nil
			lista_completa += [nodoActual.get_dato.to_s]
			nodoActual = nodoActual.get_referencia
		end
		lista_completa += [nodoActual.get_dato.to_s]
		
		impresion = ""
		tamanoimpresion = @tamano -1
		for  i in(0..tamanoimpresion) 
			impresion = impresion + lista_completa[i].to_s
			if i < tamanoimpresion
			impresion += ","
			end
			
		end
		puts impresion
	end

	def get_tamano
		return @tamano
	end
end

lista = LinkedList.new
detencion = nil

while detencion != -1
	a = gets.chomp	#SUUUUPPPPERR IMPORTANTE!!!!!!
	if a.to_i == -1
		detencion = -1
	else
	lista.agregar_elemento(a)
	end
end

lista.imprimir_lista
