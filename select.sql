-- FUNCTION: public.ActivateElement(integer)

-- DROP FUNCTION IF EXISTS public."ActivateElement"(integer);

CREATE OR REPLACE FUNCTION public."ActivateElement"(
	in_element_id integer)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
-- It will make the active_flag for the given element as true
BEGIN
	UPDATE m_element SET active_flag = TRUE WHERE id = in_element_id;
	IF FOUND THEN return TRUE; END IF;
	return FALSE;
END;
$BODY$;

ALTER FUNCTION public."ActivateElement"(integer)
    OWNER TO root;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO gis_user;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO lambda_user;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO node_user;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO race_user;

GRANT EXECUTE ON FUNCTION public."ActivateElement"(integer) TO root;

