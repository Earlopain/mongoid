module Mongoid
  module Association
    module Embedded
      class EmbedsOne

        # Binding class for all embeds_one relations.
        #
        # @since 7.0
        class Binding
          include Bindable

          # Binds the base object to the inverse of the relation. This is so we
          # are referenced to the actual objects themselves on both sides.
          #
          # This case sets the association metadata on the inverse object as well as the
          # document itself.
          #
          # @example Bind the document.
          #   person.name.bind(:continue => true)
          #   person.name = Name.new
          #
          # @since 2.0.0.rc.1
          def bind_one
            target.parentize(base)
            binding do
              target.do_or_do_not(association.inverse_setter(target), base)
            end
          end

          # Unbinds the base object and the inverse, caused by setting the
          # reference to nil.
          #
          # @example Unbind the document.
          #   person.name.unbind(:continue => true)
          #   person.name = nil
          #
          # @since 2.0.0.rc.1
          def unbind_one
            binding do
              target.do_or_do_not(association.inverse_setter(target), nil)
            end
          end
        end
      end
    end
  end
end
